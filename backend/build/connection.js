"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const promise_mysql_1 = __importDefault(require("promise-mysql"));
const pool = promise_mysql_1.default.createPool({
    host: 'mysql-db',
    port: 3306,
    user: 'admin',
    password: 'admin',
    database: 'voluntex',
});
pool.getConnection()
    .then(connection => {
    pool.releaseConnection(connection);
    console.log('DB is Connected');
}, onrejected => {
    console.log(onrejected)
});
exports.default = pool;
