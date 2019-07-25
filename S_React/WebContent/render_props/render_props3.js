class Cat extends React.Component {
  render() {
    const mouse = this.props.mouse;
    return (
      <img src="./cat.jpeg" style={{ position: 'absolute', left: mouse.x, top: mouse.y }} />
    );
  }
}

class Mouse extends React.Component {
  constructor(props) {
    super(props);
    this.handleMouseMove = this.handleMouseMove.bind(this);
    this.state = { x: 0, y: 0 };
  }

  handleMouseMove(event) {
    this.setState({
      x: event.clientX,
      y: event.clientY
    });
  }

  render() {
    return (
      <div style={{ height: '100%' }} onMouseMove={this.handleMouseMove}>

        {/*
          Instead of providing a static representation of what <Mouse> renders,
          use the `render1` prop to dynamically determine what to render.
           这里直接调用props中的函数，这里不用写死Cat
        */}
        {this.props.render1(this.state)}
      </div>
    );
  }
}

class MouseTracker extends React.Component {
  render() {
    return (
      <div>
        <h1>移动鼠标333!</h1>
        <Mouse render1={mouse => (
          <Cat mouse={mouse} />
        )}/> {/* props中定义的属性是一个函数，使用{}包起来，这样Cat组件就不用写死在Mouse的类中了*/}
      </div>
    );
  }
}