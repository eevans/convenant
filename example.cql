
-- Drop and (re)create the keyspace and tables.
DROP   KEYSPACE IF EXISTS covenant;
CREATE KEYSPACE           covenant WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

CREATE TYPE covenant.record (
    balance   int,      -- Our application data
    txStart   timestamp,
    txEnd     timestamp,
    txLease   timestamp,
    txUpdated timestamp,
    txState   tinyint,  -- (1,2,3) == (Prepared, Committed, Aborted)
    txID      uuid,
    txVersion int,
);

CREATE TABLE covenant.account (
    id        text      PRIMARY KEY,
    current   record,
    previous  record,
);

CREATE TABLE covenant.transaction_status (
    txID      uuid      PRIMARY KEY,
    state     tinyint,
    created   timestamp,
);


-- Example queries
-- INSERT INTO covenant.account (id, current)
--        VALUES ('jericevans',
--            {
--                balance:   50,
--                txStart:   '2019-12-23T15:43:28-06:00',
--                txEnd:     '2019-12-23T15:43:28-06:00',
--                txLease:   '2019-12-23T15:43:28-06:00',
--                txUpdated: '2019-12-23T15:43:28-06:00',
--                txState:   2,
--                txID:      uuid(),
--                txVersion: 1
--            }
--        );
-- INSERT INTO covenant.account (id, current, previous)
--        VALUES ('jericevans',
--            {
--                balance:   20,
--                txStart:   '2019-12-23T16:43:28-06:00',
--                txEnd:     '2019-12-23T16:43:28-06:00',
--                txLease:   '2019-12-23T16:43:28-06:00',
--                txUpdated: '2019-12-23T16:43:28-06:00',
--                txState:   2,
--                txID:      uuid(),
--                txVersion: 2
--            },
--            {
--                balance:   50,
--                txStart:   '2019-12-23T15:43:28-06:00',
--                txEnd:     '2019-12-23T15:43:28-06:00',
--                txLease:   '2019-12-23T15:43:28-06:00',
--                txUpdated: '2019-12-23T15:43:28-06:00',
--                txState:   2,
--                txID:      uuid(),
--                txVersion: 1
--            }
--        );
-- 
-- SELECT id,current.balance,current.txState FROM covenant.account WHERE id = 'jericevans';
-- 
--  id         | current.balance | current.txstate
-- ------------+-----------------+-----------------
--  jericevans |              20 |               2
       
 
