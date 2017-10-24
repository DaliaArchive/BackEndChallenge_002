const Combat = (props) => {
  return <div>
    {
      props.movesSelf.map((move, index) => {
        return <div key={"combat-" + index}>
          { move } vs { props.movesAdversary[index] }
        </div>
      })
    }
  </div>
}
