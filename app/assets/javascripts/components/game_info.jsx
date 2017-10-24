const GameInfo = (props) => {
  return <div>
    Game ID: <input type="text" value={props.gameId} readOnly />
  </div>
}