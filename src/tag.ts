export const track = (eventName: string, payload?: any) => {
  // In a real implementation, you would send this data to your analytics backend
  const event = {
    eventName,
    payload,
    timestamp: new Date().toISOString(),
  }

  console.log('TRACK', event)
  // Here you can send the event to your analytics backend, e.g., using fetch or an analytics SDK
}