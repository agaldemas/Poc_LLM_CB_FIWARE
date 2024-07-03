import { OPENAI_API_KEY } from './config.js';
import './map.js';
import OpenAI from 'openai'

window.chatApp = window.chatApp || {};

const openai = new OpenAI({
  apiKey: OPENAI_API_KEY,
  dangerouslyAllowBrowser: true
})

export async function createThreadAssistant() {
  var monuments = await window.chatApp.getPoIs() // Get the PoIs from the map
  const thread = await openai.beta.threads.create({})
  //console.log('Thread has been created: ', thread)
  console.log(`Thread has been created with the all PoIs: ${monuments.length}`)
  //print the PoIs using a forEach loop and with the title and location and numbered
  monuments.forEach(function(entity, index) {
    console.log(`${index + 1}. ${entity.title.value} at ${entity.location.value.coordinates}`);
  });

  // this should change dinamically through the conversation
  // for instance, update this with a subscription to the CB: send a notification when a new NGSILD instructions entity is sent.
  const instructions = `You are an assistant for tourists in the city from where the data is provided. You only can answer me about the next point of interests that I provide you in NGSI format: ${JSON.stringify(monuments)}`

  const assistant = await openai.beta.assistants.create({
    instructions: instructions,
    model: 'gpt-3.5-turbo',
  })
  return [thread, assistant];
}

export async function sendMessage(threadId, assistantId, userMessage) {
  var entities_are = await window.chatApp.getPoIs();
  console.log(`Entities are:`);
  entities_are.forEach(function(entity) {
    var location = entity.location.value.coordinates;
    var title = entity.title.value;
    console.log('title:' + title + " location: " + location);
  });
  const message = await openai.beta.threads.messages.create(threadId, {
    role: 'user',
    content: userMessage,
  })
  //console.log('Adding message to thread: ', message)

  const run = await openai.beta.threads.runs.create(threadId, {
    assistant_id: assistantId,
  })

  console.log('Run has been created: ', run)

  const checkRun = async () => {
    return new Promise((resolve, reject) => {
      const interval = setInterval(async () => {
        const retrieveRun = await openai.beta.threads.runs.retrieve(
          threadId,
          run.id
        )
        console.log('Run status: ', retrieveRun.status)
        if (retrieveRun.status === 'completed') {
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

  console.log('Answer: ', answer.text.value)

  return answer.text.value; // Return the response from the assistant
}
