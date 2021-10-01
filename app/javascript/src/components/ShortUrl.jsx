import React, { useEffect, useState } from "react";

const ShortUrl = () => {
  const [textInput, setTextInput] = useState('');
  const [receivedShortUrl, setReceivedShortUrl] = useState(false);
  const [shortUrl, setShortUrl] = useState('');
  const [copied, setCopied] = useState(false);
  const [errorMessages, setErrorMessages] = useState([]);

  useEffect(() => {
    const timer = setTimeout(() => {
      if (copied) setCopied(false)
      if (errorMessages.length > 0) resetAllState()
    }, 3000)

    return () => clearTimeout(timer)
  }, [copied, errorMessages])

  const resetAllState = () => {
    setTextInput('')
    setReceivedShortUrl(false)
    setShortUrl('')
    setCopied(false)
    setErrorMessages([])
  }

  const postSortUrl = async () => {
    let data = { url: textInput }
    let token = document.querySelector('meta[name="csrf-token"]').content
    let response = await fetch('/api/v1/short_links', {
      method: 'POST',
      headers: {
        "Content-Type": "application/json",
        "X-Requested-With": 'XMLHttpRequest',
        "X-CSRF-Token": token,
      },
      body: JSON.stringify(data)
    })
    let resJSON = await response.json()

    if (response.ok) {
      let location = window.location.href
      setShortUrl(location + resJSON.short_url_identifier)
      setReceivedShortUrl(true)
    } else {
      setErrorMessages(resJSON.message)
    }
  }

  const handleOnSubmit = () => {
    if (textInput === '') return
    postSortUrl()
  }

  const handleOnCopyClick = (e) => {
    navigator.clipboard.writeText(shortUrl)
    setCopied(true)
  }

  const renderButton = () => {
    let btnColorClass = "bg-yellow-400 border-yellow-500"
    if (receivedShortUrl) {
      let copyText = "Copy"
      btnColorClass = "bg-blue-400 border-blue-500"
      if (copied) {
        copyText = "Copied"
        btnColorClass = "bg-green-400 border-green-500"
      }
      return (
        <button
          className={`px-4 rounded-r-lg ${btnColorClass} text-white font-bold p-4 uppercase border-t border-b border-r w-28`}
          onClick={handleOnCopyClick}
        >
          {copyText}
        </button>
      )
    }

    return (
      <button
        className={`px-4 rounded-r-lg ${btnColorClass} text-gray-800 font-bold p-4 uppercase border-t border-b border-r w-28`}
        onClick={handleOnSubmit}
      >
        Shorten
      </button>
    )
  }

  const renderError = () => {
    if (errorMessages.length < 1) return

    return (
      <div className="fixed flex gap-4 bg-red-500 p-4 rounded-md w-3/12 mt-52">
        <div className="space-y-1 text-sm">
          <h6 className="font-medium text-white">Error</h6>
          {errorMessages.map(msg => (
            <p className="text-red-100 leading-tight">{msg}</p>
          ))}
        </div>
      </div>
    )
  }

  const renderUrl = () => {
    if (!receivedShortUrl) return

    return (
      <span className="fixed truncate font-semibold text-xs -mt-24 w-3/12">
        URL: {textInput}
      </span>
    )
  }

  const renderResetBtn = () => {
    if (!receivedShortUrl) return

    return (
      <div className="fixed mb-2 mt-32" style={{marginLeft: "32rem"}}>
        <button
          className="px-5 py-3 rounded-xl text-sm font-medium text-indigo-600 outline-none focus:outline-none border-4 border-transparent hover:text-indigo-800 focus:border-purple-200 active:border-transparent active:text-grey-900 transition-all"
          onClick={() => resetAllState()}
        >
          Reset
        </button>
      </div>
    )
  }

  return (
    <div className="max-w-6xl px-6 mx-auto flex items-center justify-center">
      {renderUrl()}
        <div className="m-60 flex w-10/12">
          <input
            className="rounded-l-lg p-4 border-t mr-0 border-b border-l text-gray-800 border-gray-200 bg-white w-10/12 cursor-text"
            placeholder="Shorten your link"
            value={receivedShortUrl ? shortUrl : textInput}
            onChange={(e) => setTextInput(e.target.value)}
          />
          {renderButton()}
        </div>
        {renderResetBtn()}
        {renderError()}
    </div>
  )
}

export default ShortUrl;