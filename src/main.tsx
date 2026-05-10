import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import posthog from 'posthog-js'

posthog.init('phc_pANT6TwGij29sd5gmTzEkvGL9EKgfFcXnaYpEqz2KtCm', {
  api_host: 'https://us.i.posthog.com',
  defaults: '2026-01-30',
  person_profiles: 'identified_only', // or 'always' to create profiles for anonymous users as well
})
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
