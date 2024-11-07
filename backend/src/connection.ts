import mysql from 'promise-mysql';

const pool = mysql.createPool({
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
    });

export default pool;