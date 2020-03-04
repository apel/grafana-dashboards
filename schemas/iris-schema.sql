CREATE TABLE IrisVOs (
    VO VARCHAR(255) NOT NULL,

    PRIMARY KEY (VO)
);

CREATE TABLE Allocations (
    Date TIMESTAMP NOT NULL,
    Activity VARCHAR(255) NOT NULL,
    Allocation BIGINT,

    PRIMARY KEY (Date,Activity)
);

CREATE TABLE Capacity (
    Date TIMESTAMP NOT NULL,
    Project VARCHAR(255) NOT NULL,
    Capacity BIGINT,

    PRIMARY KEY (Date,Project)
);

CREATE TABLE Projects (
    Site VARCHAR(255) NOT NULL,
    Project VARCHAR(255) NOT NULL,

    PRIMARY KEY (Site,Project)
);

--------------------------------------------------------------------------------
-- View on Sites

CREATE VIEW VAllSites AS
    SELECT iris_grid.Sites.name AS name, 'Grid' AS tag
    FROM iris_grid.Sites
    UNION
    SELECT iris_cloud.Sites.name AS name, 'Cloud' AS tag
    FROM iris_cloud.Sites WHERE (iris_cloud.Sites.name <> 'None');

--------------------------------------------------------------------------------
-- View on VOs

CREATE VIEW VAllVOs AS
    SELECT iris_grid.VOs.name AS name, 'Grid' AS tag
    FROM iris_grid.VOs
    UNION
    SELECT iris_cloud.VOs.name AS name, 'Cloud' AS tag
    FROM iris_cloud.VOs;
