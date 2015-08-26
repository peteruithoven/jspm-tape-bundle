import test from 'tape'; // importing tape breaks sfx bundle, resulting in error: System is not defined
console.log('test: ', test);

const world = 'earth';
console.log(`Hello ${world}`);
