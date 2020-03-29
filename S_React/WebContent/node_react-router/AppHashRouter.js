import React from "react";
import { HashRouter , Route, Link } from "react-router-dom";

function Index() {
  return <h2>Home</h2>;
}

function About() {
  return <h2>About</h2>;
}

function Users() {
  return <h2>Users</h2>;
}

function AppRouter() {
  return (
    <HashRouter   basename="/calendar"> {/* basename可以不加 ，显示为  #/calendar/users/ ,会影响浏览器的返回 */}
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about/">About</Link>
            </li>
            <li>
              <Link to="/users/">Users</Link>
            </li>
          </ul>
        </nav>

        <Route path="/" exact component={Index} />  
        <Route path="/about/" component={About} />
        <Route path="/users/" component={Users} />
      </div>
    </HashRouter>
  );
}

export default AppRouter;