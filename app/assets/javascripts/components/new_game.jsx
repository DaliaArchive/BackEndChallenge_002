class NewGame extends React.Component {
  constructor(props) {
    super(props)
  }

  render(){
    const props = this.props

    return <div>
      <h2>New Game</h2>

      <button>Generate New Game</button><br/>
      Join Existing Game: <input type="text" placeholder="Game ID" />

      <button onClick={props.createGameFn}>Fight</button>
    </div>
  }
}
