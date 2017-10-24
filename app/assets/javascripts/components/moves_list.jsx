const MovesList = (props) => {
  return <div>
    {
      props.moves.map((move, index) => {
        return <div key={"move-" + index}>
          { move }
        </div>
      })
    }
  </div>
}