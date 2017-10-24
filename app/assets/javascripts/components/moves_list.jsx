const MovesList = (props) => {
  return <div className="game-content">
    <h3>Your Moves</h3>
    {
      props.moves.map((move, index) => {
        return <div key={"move-" + index}>
          { move }
        </div>
      })
    }
  </div>
}