// openai.js
import OpenAI from 'openai'

const monuments = require('../data/monuments_madrid.json')

const openai = new OpenAI({
  apiKey: 'TODO_API_KEY',
  dangerouslyAllowBrowser: true
})

export async function createThreadAssistant() {
  const thread = await openai.beta.threads.create({})
  //console.log('Thread has been created: ', thread)

  const instructions = `You are an assistant for tourists in Madrid. You only can answer me about the next point of interests that I provide you in NGSILD format: ${JSON.stringify(monuments)}`

  const assistant = await openai.beta.assistants.create({
    instructions: instructions,
    model: 'gpt-3.5-turbo',

  })
  return [thread, assistant];
}

export async function sendMessage(threadId, assistantId, userMessage) {
  const message = await openai.beta.threads.messages.create(threadId, {
    role: 'user',
    content: userMessage,
  })
  //console.log('Adding message to thread: ', message)

  const run = await openai.beta.threads.runs.create(threadId, {
    assistant_id: assistantId,
  })

  //console.log('Run has been created: ', run)

  const checkRun = async () => {
    return new Promise((resolve, reject) => {
      const interval = setInterval(async () => {
        const retrieveRun = await openai.beta.threads.runs.retrieve(
          threadId,
          run.id
        )

        //console.log('Run status: ', retrieveRun.status)

        if (retrieveRun.status === 'completed') {
          //console.log('Run completed: ', retrieveRun)

          clearInterval(interval)
          resolve(retrieveRun)
        }
      }, 1000)
    })
  }

  await checkRun()

  const messages = await openai.beta.threads.messages.list(threadId)

  const answer = (messages.data ?? []).find((m) => m?.role === 'assistant')
    ?.content?.[0]

  //console.log('Answer: ', answer.text.value)

  return answer.text.value; // Return the response from the assistant
}
