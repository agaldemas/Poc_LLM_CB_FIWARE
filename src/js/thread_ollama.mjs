// openai.js
import OpenAI from 'openai'

const monuments = require('../data/monuments_madrid.json')

const openai = new OpenAI({
  baseURL: 'http://localhost:11434/v1',
  apiKey: 'ollama', // required but unused
  dangerouslyAllowBrowser: true,
  defaultHeaders: {
    'Access-Control-Allow-Origin': '*'
  },
})
const instructions = `You are an assistant for tourists in Madrid. You only can answer me about the next point of interests that I provide you in NGSILD format: ${JSON.stringify(monuments)}, return the answer formatted in markdown`;


export async function createThreadAssistant() {
  return openai;
}

export async function sendMessage(openaiInstance, userMessage) {
  console.log('userMessage: ', userMessage);
  const completion = await openaiInstance.chat.completions.create({
    model: 'phi3', // Replace with the name of your local model
    messages: [
      { role: 'system', content: instructions }, // Set your instructions here
      { role: 'user', content: userMessage },
    ],
  });
  console.log('completion: ', completion);
  return completion.choices[0].message;
}

  //console.log('Run has been created: ', run)

  // const checkRun = async () => {
  //   return new Promise((resolve, reject) => {
  //     const interval = setInterval(async () => {
  //       const retrieveRun = await openai.beta.threads.runs.retrieve(
  //         threadId,
  //         run.id
  //       )

  //       //console.log('Run status: ', retrieveRun.status)

  //       if (retrieveRun.status === 'completed') {
  //         //console.log('Run completed: ', retrieveRun)

  //         clearInterval(interval)
  //         resolve(retrieveRun)
  //       }
  //     }, 1000)
  //   })
  // }

  // await checkRun()

  //const messages = await openai.beta.threads.messages.list(threadId)

  // const answer = (messages.data ?? []).find((m) => m?.role === 'assistant')
  //   ?.content?.[0]

  //console.log('Answer: ', answer.text.value)

  //return answer.text.value; // Return the response from the assistant
//}
