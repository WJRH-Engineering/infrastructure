-- schemas for tables in the production database, with explanations

-- schema for the remote_shows table
-- The auth table is used to store connection and authentication data for shows 
-- using the remote studio. It stores the show's shortname, icecast mountpoint,
-- and password. 

create table remote_shows (
    id serial primary key,
    shortname text not null unique,
    password text,
    mountpoint text
);

-- the schedule table stores info about the program schedule as a list of
-- program names and timeslots, with a year and season column to distinguish
-- between schedules at different times of the year.

-- SQL offers no convenient data type for storing datetimes that repeat each
-- week, but Postgres does offer a timerange datatype which can be used to
-- represent this. We store all timeslot information as an offset from midnight
-- on January 1st of 1996. This date is convenient because it happens to fall
-- on a monday, so the day of the week and the day of the month can be 
-- substituted.
create table schedule (
	id serial primary key,
	shortname text not null,
	time_range tstzrange not null,
	year integer not null,
	season text not null,
    CONSTRAINT schedule_time_range_check CHECK (
		(time_range <@ '["1996-01-01 00:00:00+00","1996-01-09 00:00:00+00"]'::tstzrange)
	)
);
