import { track } from "./tag"
import posthog from 'posthog-js'
function App() {

  return (
    <>
        1
        <button
          onClick={() => track('button_clicked', { buttonName: 'track me' })}
        >track me</button>
        <button
        onClick={() => {
          posthog.capture('button_click', {
            buttonName: 'buy',
            page: 'homepage',
          })
        }}
      >
        Click Me
      </button>
    </>
  )
}

export default App
