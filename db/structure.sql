--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: beds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE beds (
    id integer NOT NULL,
    number integer NOT NULL,
    room_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: beds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE beds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: beds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE beds_id_seq OWNED BY beds.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bookings (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    bed_id integer NOT NULL,
    guest_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bookings_id_seq OWNED BY bookings.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE guests (
    id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE guests_id_seq OWNED BY guests.id;


--
-- Name: historicals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE historicals (
    id integer NOT NULL,
    name character varying,
    value numeric,
    start_date date,
    location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: historicals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE historicals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: historicals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE historicals_id_seq OWNED BY historicals.id;


--
-- Name: houses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE houses (
    id integer NOT NULL,
    name character varying NOT NULL,
    sketch character varying,
    location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE houses_id_seq OWNED BY houses.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rooms (
    id integer NOT NULL,
    name character varying NOT NULL,
    house_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rooms_id_seq OWNED BY rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY beds ALTER COLUMN id SET DEFAULT nextval('beds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings ALTER COLUMN id SET DEFAULT nextval('bookings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY guests ALTER COLUMN id SET DEFAULT nextval('guests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY historicals ALTER COLUMN id SET DEFAULT nextval('historicals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY houses ALTER COLUMN id SET DEFAULT nextval('houses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: beds_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY beds
    ADD CONSTRAINT beds_pkey PRIMARY KEY (id);


--
-- Name: bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: guests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: historicals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY historicals
    ADD CONSTRAINT historicals_pkey PRIMARY KEY (id);


--
-- Name: houses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_beds_on_room_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_beds_on_room_id ON beds USING btree (room_id);


--
-- Name: index_bookings_on_bed_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bookings_on_bed_id ON bookings USING btree (bed_id);


--
-- Name: index_bookings_on_guest_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bookings_on_guest_id ON bookings USING btree (guest_id);


--
-- Name: index_bookings_on_start_date_and_end_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bookings_on_start_date_and_end_date ON bookings USING btree (start_date, end_date);


--
-- Name: index_historicals_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_historicals_on_location_id ON historicals USING btree (location_id);


--
-- Name: index_houses_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_houses_on_location_id ON houses USING btree (location_id);


--
-- Name: index_rooms_on_house_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rooms_on_house_id ON rooms USING btree (house_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_beds_room_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY beds
    ADD CONSTRAINT fk_beds_room_id FOREIGN KEY (room_id) REFERENCES rooms(id);


--
-- Name: fk_bookings_bed_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT fk_bookings_bed_id FOREIGN KEY (bed_id) REFERENCES beds(id);


--
-- Name: fk_bookings_guest_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT fk_bookings_guest_id FOREIGN KEY (guest_id) REFERENCES guests(id);


--
-- Name: fk_historicals_location_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY historicals
    ADD CONSTRAINT fk_historicals_location_id FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_houses_location_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY houses
    ADD CONSTRAINT fk_houses_location_id FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rooms_house_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT fk_rooms_house_id FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20160117015536');

INSERT INTO schema_migrations (version) VALUES ('20160117031750');

INSERT INTO schema_migrations (version) VALUES ('20160117034228');

INSERT INTO schema_migrations (version) VALUES ('20160117035019');

INSERT INTO schema_migrations (version) VALUES ('20160117035205');

INSERT INTO schema_migrations (version) VALUES ('20160117035235');

INSERT INTO schema_migrations (version) VALUES ('20160117042101');

INSERT INTO schema_migrations (version) VALUES ('20160726175948');

