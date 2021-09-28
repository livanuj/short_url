import React from 'react';

const App = () => {
  return (
    <div>
      <form className="m-10 flex">
        <input className="rounded-l-lg p-2 border-t mr-0 border-b border-l text-gray-800 border-gray-200 bg-white" placeholder="Shorten your link"/>
      <button className="px-8 rounded-r-lg bg-yellow-400  text-gray-800 font-bold p-4 uppercase border-yellow-500 border-t border-b border-r">Shorten</button>
    </form>
  </div>
  )
}

export default App;
