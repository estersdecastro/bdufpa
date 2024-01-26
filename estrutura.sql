CREATE TABLE "Usuario" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar(128) NOT NULL,
  "nome_social" varchar(128),
  "email" varchar(64) UNIQUE NOT NULL,
  "celular" varchar(32),
  "pcd" boolean NOT NULL,
  "pcd_tipo" varchar(32) NOT NULL,
  "campus" varchar(64) NOT NULL,
  "instituto" varchar(64) NOT NULL,
  "tipo_login" varchar(32) NOT NULL,
  "senha" varchar(256) NOT NULL
);

CREATE TABLE "UsuarioDiscente" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "matricula" varchar(32) UNIQUE NOT NULL,
  "curso" varchar(32) NOT NULL,
  "id_usuario" int NOT NULL
);

CREATE TABLE "UsuariosTae" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "siape" varchar(32) UNIQUE NOT NULL,
  "nucleo" boolean NOT NULL,
  "id_usuario" int NOT NULL
);

CREATE TABLE "UsuarioColaborador" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "cpf" varchar(32) UNIQUE NOT NULL,
  "id_usuario" int NOT NULL
);

CREATE TABLE "UsuarioDocente" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "siape" varchar(32) UNIQUE NOT NULL,
  "curso" varchar(32) NOT NULL,
  "nucleo" boolean NOT NULL,
  "id_usuario" int NOT NULL
);

CREATE TABLE "UsuarioTecAccesibilidade" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "siape" varchar(32) UNIQUE NOT NULL,
  "nucleo" boolean NOT NULL,
  "id_usuario" int NOT NULL
);

CREATE TABLE "Categorias" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar(32) NOT NULL
);

CREATE TABLE "PEA" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "formato" varchar(32),
  "tipo" varchar(32) NOT NULL,
  "id_categoria" int,
  "local" varchar(32) NOT NULL,
  "uso" varchar(32) NOT NULL,
  "fonte_original" varchar(128) NOT NULL,
  "cid_pcd" VARCHAR(32) NOT NULL,
  "comentario" TEXT
);

COMMENT ON COLUMN "PEA"."uso" IS 'Indidual|Grupo';

ALTER TABLE "UsuarioDiscente" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "UsuariosTae" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "UsuarioColaborador" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "UsuarioDocente" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "UsuarioTecAccesibilidade" ADD FOREIGN KEY ("id_usuario") REFERENCES "Usuario" ("id");

ALTER TABLE "PEA" ADD FOREIGN KEY ("id_categoria") REFERENCES "Categorias" ("id");
