class FinishedGame extends React.Component {
  constructor(props) {
    super(props)
  }

  render(){
    const props = this.props

    return <div>
      <div className="game-intro">
        <h2>Game Over</h2>
        <p>Your personal status</p>

        <GameInfo gameId={props.gameId} />
      </div>

      <Combat movesSelf={props.movesSelf} movesAdversary={props.movesAdversary} />
    </div>
  }
}
