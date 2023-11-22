import crypto from 'crypto';

const k1 = crypto.randomBytes(32).toString('hex');
const k2 = crypto.randomBytes(32).toString('hex');
console.table({k1, k2});