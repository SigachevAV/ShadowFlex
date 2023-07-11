CREATE TYPE adept_power_activation AS ENUM (
    'MIN',
    'MAJ',
    'PAS'
);

CREATE TYPE matrix_action_access AS (
	outsider boolean,
	"user" boolean,
	admin boolean
);

CREATE TYPE matrix_action_type AS ENUM (
    'MAJOR',
    'MINOR'
);

CREATE TYPE spell_category AS ENUM (
    'COM',
    'DET',
    'HEAL',
    'ILL',
    'MAN'
);

CREATE TYPE spell_damage AS ENUM (
    'P',
    'S',
    'SPEC'
);

CREATE TYPE spell_duration AS ENUM (
    'I',
    'S',
    'L',
    'P'
);

CREATE TYPE spell_range AS ENUM (
    'LOS',
    'LOSA',
    'TOUCH',
    'SPEC'
);

CREATE TYPE spell_type AS ENUM (
    'P',
    'M'
);

CREATE TABLE adept_power (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name_ru character varying(256) NOT NULL,
    name_en character varying(256) NOT NULL,
    cost character varying(256) NOT NULL,
    activation adept_power_activation NOT NULL,
    description_ru text NOT NULL,
    description_en text NOT NULL
);

CREATE TABLE matrix_action (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name_ru character varying(256) NOT NULL,
    name_en character varying(256) NOT NULL,
    is_legal boolean NOT NULL,
    access matrix_action_access NOT NULL,
    check_ru character varying(256) NOT NULL,
    check_en character varying(256) NOT NULL,
    description_ru text NOT NULL,
    description_en text NOT NULL,
    type matrix_action_type NOT NULL
);

CREATE TABLE spell (
    id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    category spell_category NOT NULL,
    name_ru character varying(256) NOT NULL,
    range spell_range NOT NULL,
    duration spell_duration NOT NULL,
    type spell_type NOT NULL,
    dv integer NOT NULL,
    damage spell_damage NOT NULL,
    description_ru text NOT NULL,
    description_en text NOT NULL,
    name_en character varying(256) NOT NULL
);