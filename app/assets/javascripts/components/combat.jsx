const Combat = (props) => {
  return <div className="game-content">
    <h2>Your Moves — Adversary's Moves</h2>
    {
      props.movesSelf.map((move, index) => {
        return <div key={"combat-" + index} className="combat-moves">
          <div>{ move }</div>
          <div>{ props.movesAdversary[index] }</div>
        </div>
      })
    }
  </div>
}
