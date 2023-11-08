
import http from 'k6/http';
import { check } from 'k6';

const BASE_URL = `http://localhost:${__ENV.PORT}`;

export default function () {
  const res = http.get(`${BASE_URL}/`);
  check(res, {
    'status is 200': (r) => r.status === 200,
    'response body': (r) => r.body === 'Hello, World!',
  });
}
