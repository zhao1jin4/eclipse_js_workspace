import React from "react";
import { BrowserRouter  , Route, Link } from "react-router-dom";

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
    //会影响浏览器的返回 
    <BrowserRouter>
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

        <Route path="/" exact component={Index} /> {/*  exact 表示精确匹配，如不指定则跳转地址只要以配置的path开头即可 */}
        <Route path="/about/" component={About} />
        <Route path="/users/" component={Users} />
      </div>
    </BrowserRouter>
  );
}

export default AppRouter;