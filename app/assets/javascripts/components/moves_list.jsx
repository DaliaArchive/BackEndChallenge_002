const MovesList = (props) => {
  return <div className="game-content">
    {
      props.moves.map((move, index) => {
        return <div key={"move-" + index}>
          { move }
        </div>
      })
    }
  </div>
}