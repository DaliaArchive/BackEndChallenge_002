const GameInfo = (props) => {
  return <div>
    Game ID: <input id="game-id-info" type="text" value={props.gameId} readOnly />
  </div>
}