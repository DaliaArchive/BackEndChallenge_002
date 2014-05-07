class Game < ActiveRecord::Base
  MOVES_SIZE = 10

  enum state: [:waiting, :finished]
  belongs_to :combat_result

  scope :editable, ->(uuid) { waiting.where("uuid != ?", uuid)}
  scope :assigned_to_user, ->(uuid) { where("uuid = ? OR adversary_uuid = ?", uuid, uuid)}

  validates :uuid, uniqueness: true, presence: true
  validates :adversary_uuid, uniqueness: true, presence: true, if: ->(game){ game.finished? }
  validates :owner_result, presence: true, if: ->(game){ game.finished? }
  validates :adversary_result, presence: true, if: ->(game){ game.finished? }
  validate :moves_size
  validate :moves_permitted_values
  validate :adversary_moves_size
  validate :adversary_moves_permitted_values

  def self.search(uuid)
    game = waiting.where("uuid = ?", uuid).first
    game || Game.new
  end

  protected
  def moves_size
    validate_moves_size(:moves)
  end

  def moves_permitted_values
    validate_moves_permitted_values(:moves)
  end

  def adversary_moves_size
    validate_moves_size(:adversary_moves)
  end

  def adversary_moves_permitted_values
    validate_moves_permitted_values(:adversary_moves)
  end

  private
  def validate_moves_size(field_name)
    array_size = self.send(field_name).size
    if !array_size.zero? && array_size != MOVES_SIZE
      errors.add(field_name, "expect to have #{MOVES_SIZE} moves")
    end
  end

  def validate_moves_permitted_values(field_name)
    unknown_values = self.send(field_name).to_a - Move::LIST
    unless unknown_values.blank?
      errors.add(field_name, "contain [#{unknown_values.join(', ')}] unknown values")
    end
  end
end
