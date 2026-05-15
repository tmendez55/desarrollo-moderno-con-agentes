import { describe, it } from 'node:test';
import assert from 'node:assert/strict';
import { greet } from './greeter.js';

describe('greet', () => {
  it('saluda en español por defecto', () => {
    const result = greet('Marta');
    assert.equal(result.message, 'Hola, Marta.');
    assert.equal(result.language, 'es');
    assert.equal(result.recipient, 'Marta');
  });

  it('saluda en inglés cuando lang === "en"', () => {
    const result = greet('Marta', 'en');
    assert.equal(result.message, 'Hello, Marta.');
    assert.equal(result.language, 'en');
  });

  it('hace trim del nombre antes de saludar', () => {
    const result = greet('   Marta   ');
    assert.equal(result.recipient, 'Marta');
    assert.equal(result.message, 'Hola, Marta.');
  });

  it('lanza error si el nombre es vacío después del trim', () => {
    assert.throws(() => greet(''), /no puede estar vacío/);
    assert.throws(() => greet('   '), /no puede estar vacío/);
  });

  it('devuelve un objeto Greeting con la forma esperada', () => {
    const result = greet('Ana', 'en');
    assert.deepEqual(Object.keys(result).sort(), ['language', 'message', 'recipient']);
  });
});
