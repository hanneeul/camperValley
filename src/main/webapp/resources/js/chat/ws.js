// ws.js

const ws = new WebSocket(`ws://${location.host}/spring/echo`);

ws.addEventListener('open', (e) => console.log('open :', e));
ws.addEventListener('message', (e) => console.log('message :', e));
ws.addEventListener('error', (e) => console.log('error :', e));
ws.addEventListener('close', (e) => console.log('close :', e));