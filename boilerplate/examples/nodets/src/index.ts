import { greet } from './modules/greeter/index.js';

const name = process.argv[2] ?? 'mundo';
const lang = (process.argv[3] as 'es' | 'en' | undefined) ?? 'es';

const greeting = greet(name, lang);
console.log(greeting.message);
