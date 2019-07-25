import React from "react";
import { BrowserRouter as BrowserRouter, Route, Link } from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <div>
        <Header />

        <Route exact path="/" component={Home} />
        <Route path="/about" component={About} />
        <Route path="/topics" component={Topics} />
      </div>
    </BrowserRouter>
  );
}

function Home() {
  return <h2>Home</h2>;
}

function About() {
  return <h2>About</h2>;
}

function Topic({ match }) {
  return <h3>Requested Param: {match.params.myid}</h3>; {/*match.params.xxx 得到变量名 */}
}

function Topics({ match }) {  /* match参数 */
  return (
    <div>
      <h2>Topics</h2>

      <ul>
        <li>
          <Link to={`${match.url}/components`}>Components</Link>
        </li>
        <li>
          <Link to={`${match.url}/props-v-state`}>Props v. State</Link>
        </li>
      </ul>

      <Route path={`${match.path}/:myid`} component={Topic} /> 
        {/*Link的 match.url 对应这的 match.path，BrowserRouter浏览器地址栏上会显示对应的地址
          myid是变量名，以：开头 
          component 指定子组件 */}
      <Route
        exact
        path={match.path}
        render={() => <h3>Please select a topic.</h3>}  
      />  {/* render函数 */}
    </div>
  );
}

function Header() {
  return (
    <ul>
      <li>
        <Link to="/">Home</Link>
      </li>
      <li>
        <Link to="/about">About</Link>
      </li>
      <li>
        <Link to="/topics">Topics</Link>
      </li>
    </ul>
  );
}

export default App;
