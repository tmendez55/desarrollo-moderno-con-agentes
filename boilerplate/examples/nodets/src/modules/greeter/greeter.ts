export type Language = 'es' | 'en';

export interface Greeting {
  readonly recipient: string;
  readonly language: Language;
  readonly message: string;
}

const TEMPLATES: Record<Language, (name: string) => string> = {
  es: (name) => `Hola, ${name}.`,
  en: (name) => `Hello, ${name}.`,
};

export function greet(name: string, lang: Language = 'es'): Greeting {
  const recipient = name.trim();
  if (recipient.length === 0) {
    throw new Error('greet: el nombre no puede estar vacío.');
  }
  return {
    recipient,
    language: lang,
    message: TEMPLATES[lang](recipient),
  };
}
