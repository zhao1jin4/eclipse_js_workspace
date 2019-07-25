import React from "react";
import { MemoryRouter , Route, Link,NavLink} from "react-router-dom";

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
    <MemoryRouter   initialEntries={[ '/', '/about', { pathname: '/users' } ]} 
    initialIndex={0}>  {/* 浏览器地址上没有显示，0是initialEntries的下标 */}
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
            <li>
               {/*NavLink 可带选中的样式 也有 activeClassName */}
               <NavLink
                to="/users/"
                activeStyle={{
                  fontWeight: "bold",
                  color: "red"
                }}
              >
                Users with Nav
              </NavLink>

            </li>
          </ul>
        </nav>

        <Route path="/" exact component={Index} />  
        <Route path="/about/" component={About} />
        <Route path="/users/" component={Users} />
      </div>
    </MemoryRouter>
  );
}

export default AppRouter;