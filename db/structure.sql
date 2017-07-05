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
-- Name: air_tickets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE air_tickets (
    id integer NOT NULL,
    participant_id integer,
    arrive_at timestamp without time zone,
    arrive_to character varying,
    leave_at timestamp without time zone,
    leave_from character varying,
    estimated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: air_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE air_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: air_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE air_tickets_id_seq OWNED BY air_tickets.id;


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
-- Name: configurations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE configurations (
    id integer NOT NULL,
    name character varying,
    value text
);


--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE configurations_id_seq OWNED BY configurations.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying,
    start_at date,
    end_at date,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deposit_amount numeric DEFAULT 0
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE guests (
    id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    country character varying,
    city character varying,
    phone_number character varying,
    mobile_number character varying,
    identification character varying,
    civil_status character varying,
    profession character varying,
    nationality character varying,
    health_condition text,
    receive_drug text,
    symptoms text,
    contact_name character varying,
    contact_kin character varying,
    contact_number character varying,
    hotel character varying,
    local_number character varying,
    comments text,
    is_initiate boolean,
    age integer
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
    updated_at timestamp without time zone NOT NULL,
    open_stay boolean DEFAULT false
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
-- Name: modalities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE modalities (
    id integer NOT NULL,
    name character varying,
    event_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_at timestamp without time zone,
    end_at timestamp without time zone
);


--
-- Name: modalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE modalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE modalities_id_seq OWNED BY modalities.id;


--
-- Name: participants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE participants (
    id integer NOT NULL,
    guest_id integer,
    space_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deposit_state character varying DEFAULT 'pending'::character varying
);


--
-- Name: participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE participants_id_seq OWNED BY participants.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE payments (
    id integer NOT NULL,
    participant_id integer,
    paid_at timestamp without time zone,
    amount numeric,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    method character varying,
    reason character varying DEFAULT 'Evento'::character varying
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE payments_id_seq OWNED BY payments.id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE places (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE places_id_seq OWNED BY places.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    name character varying
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: profiles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE profiles_users (
    id integer NOT NULL,
    user_id integer,
    profile_id integer
);


--
-- Name: profiles_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profiles_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profiles_users_id_seq OWNED BY profiles_users.id;


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
-- Name: spaces; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spaces (
    id integer NOT NULL,
    modality_id integer,
    place_id integer,
    amount numeric DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spaces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spaces_id_seq OWNED BY spaces.id;


--
-- Name: stays; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stays (
    id integer NOT NULL,
    participant_id integer,
    place_id integer,
    start_at timestamp without time zone,
    end_at timestamp without time zone,
    amount numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stays_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stays_id_seq OWNED BY stays.id;


--
-- Name: token_controls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE token_controls (
    id integer NOT NULL,
    guest_id integer,
    auth_token text,
    state character varying DEFAULT 'pending'::character varying
);


--
-- Name: token_controls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE token_controls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: token_controls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE token_controls_id_seq OWNED BY token_controls.id;


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

ALTER TABLE ONLY air_tickets ALTER COLUMN id SET DEFAULT nextval('air_tickets_id_seq'::regclass);


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

ALTER TABLE ONLY configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


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

ALTER TABLE ONLY modalities ALTER COLUMN id SET DEFAULT nextval('modalities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY participants ALTER COLUMN id SET DEFAULT nextval('participants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY payments ALTER COLUMN id SET DEFAULT nextval('payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY places ALTER COLUMN id SET DEFAULT nextval('places_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles_users ALTER COLUMN id SET DEFAULT nextval('profiles_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms ALTER COLUMN id SET DEFAULT nextval('rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spaces ALTER COLUMN id SET DEFAULT nextval('spaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stays ALTER COLUMN id SET DEFAULT nextval('stays_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY token_controls ALTER COLUMN id SET DEFAULT nextval('token_controls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: air_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY air_tickets
    ADD CONSTRAINT air_tickets_pkey PRIMARY KEY (id);


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
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


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
-- Name: modalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modalities
    ADD CONSTRAINT modalities_pkey PRIMARY KEY (id);


--
-- Name: participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profiles_users
    ADD CONSTRAINT profiles_users_pkey PRIMARY KEY (id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spaces
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (id);


--
-- Name: stays_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stays
    ADD CONSTRAINT stays_pkey PRIMARY KEY (id);


--
-- Name: token_controls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY token_controls
    ADD CONSTRAINT token_controls_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_air_tickets_on_participant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_air_tickets_on_participant_id ON air_tickets USING btree (participant_id);


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
-- Name: index_modalities_on_event_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_modalities_on_event_id ON modalities USING btree (event_id);


--
-- Name: index_participants_on_guest_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_participants_on_guest_id ON participants USING btree (guest_id);


--
-- Name: index_participants_on_space_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_participants_on_space_id ON participants USING btree (space_id);


--
-- Name: index_payments_on_participant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_payments_on_participant_id ON payments USING btree (participant_id);


--
-- Name: index_profiles_users_on_profile_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_profiles_users_on_profile_id ON profiles_users USING btree (profile_id);


--
-- Name: index_profiles_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_profiles_users_on_user_id ON profiles_users USING btree (user_id);


--
-- Name: index_rooms_on_house_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rooms_on_house_id ON rooms USING btree (house_id);


--
-- Name: index_spaces_on_modality_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spaces_on_modality_id ON spaces USING btree (modality_id);


--
-- Name: index_spaces_on_place_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_spaces_on_place_id ON spaces USING btree (place_id);


--
-- Name: index_stays_on_participant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stays_on_participant_id ON stays USING btree (participant_id);


--
-- Name: index_stays_on_place_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stays_on_place_id ON stays USING btree (place_id);


--
-- Name: index_token_controls_on_guest_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_token_controls_on_guest_id ON token_controls USING btree (guest_id);


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
-- Name: fk_air_tickets_participant_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY air_tickets
    ADD CONSTRAINT fk_air_tickets_participant_id FOREIGN KEY (participant_id) REFERENCES participants(id);


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
-- Name: fk_modalities_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modalities
    ADD CONSTRAINT fk_modalities_event_id FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: fk_participants_guest_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT fk_participants_guest_id FOREIGN KEY (guest_id) REFERENCES guests(id);


--
-- Name: fk_participants_space_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT fk_participants_space_id FOREIGN KEY (space_id) REFERENCES spaces(id);


--
-- Name: fk_payments_participant_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT fk_payments_participant_id FOREIGN KEY (participant_id) REFERENCES participants(id);


--
-- Name: fk_profiles_users_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles_users
    ADD CONSTRAINT fk_profiles_users_profile_id FOREIGN KEY (profile_id) REFERENCES profiles(id);


--
-- Name: fk_profiles_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles_users
    ADD CONSTRAINT fk_profiles_users_user_id FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rooms_house_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT fk_rooms_house_id FOREIGN KEY (house_id) REFERENCES houses(id);


--
-- Name: fk_spaces_modality_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY spaces
    ADD CONSTRAINT fk_spaces_modality_id FOREIGN KEY (modality_id) REFERENCES modalities(id);


--
-- Name: fk_spaces_place_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY spaces
    ADD CONSTRAINT fk_spaces_place_id FOREIGN KEY (place_id) REFERENCES places(id);


--
-- Name: fk_stays_participant_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stays
    ADD CONSTRAINT fk_stays_participant_id FOREIGN KEY (participant_id) REFERENCES participants(id);


--
-- Name: fk_stays_place_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stays
    ADD CONSTRAINT fk_stays_place_id FOREIGN KEY (place_id) REFERENCES places(id);


--
-- Name: fk_token_controls_guest_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY token_controls
    ADD CONSTRAINT fk_token_controls_guest_id FOREIGN KEY (guest_id) REFERENCES guests(id);


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

INSERT INTO schema_migrations (version) VALUES ('20170209029833');

INSERT INTO schema_migrations (version) VALUES ('20170209030519');

INSERT INTO schema_migrations (version) VALUES ('20170618070221');

INSERT INTO schema_migrations (version) VALUES ('20170618082053');

INSERT INTO schema_migrations (version) VALUES ('20170618082148');

INSERT INTO schema_migrations (version) VALUES ('20170618133334');

INSERT INTO schema_migrations (version) VALUES ('20170618134344');

INSERT INTO schema_migrations (version) VALUES ('20170618135818');

INSERT INTO schema_migrations (version) VALUES ('20170618140358');

INSERT INTO schema_migrations (version) VALUES ('20170618140522');

INSERT INTO schema_migrations (version) VALUES ('20170618140726');

INSERT INTO schema_migrations (version) VALUES ('20170618141732');

INSERT INTO schema_migrations (version) VALUES ('20170621142819');

INSERT INTO schema_migrations (version) VALUES ('20170625212559');

INSERT INTO schema_migrations (version) VALUES ('20170626020107');

INSERT INTO schema_migrations (version) VALUES ('20170626044501');

INSERT INTO schema_migrations (version) VALUES ('20170626050435');

INSERT INTO schema_migrations (version) VALUES ('20170628014850');

INSERT INTO schema_migrations (version) VALUES ('20170628023302');

INSERT INTO schema_migrations (version) VALUES ('20170705014159');

