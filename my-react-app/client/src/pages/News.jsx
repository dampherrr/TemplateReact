import React from "react";

import "../App.css";
import "../styles/navbar.scss";
import "../styles/stars.scss";

function News() {
  return (
    <>
      <div className="container">
        <h1 className="sayHello">News</h1>
        <div className="content">
          <img
            src="https://media1.tenor.com/m/fJ4z94CDdU0AAAAC/good-news.gif"
            alt="Futurama GIF"
          />
        </div>
      </div>
    </>
  );
}

export default News;
