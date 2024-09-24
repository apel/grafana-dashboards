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

CREATE VIEW VCombinedSummaries AS
SELECT
  apel_iris_grid.HybridSuperSummaries.UpdateTime,
  apel_iris_grid.site.name Site,
  STR_TO_DATE(
          CONCAT(apel_iris_grid.HybridSuperSummaries.Year, "-", apel_iris_grid.HybridSuperSummaries.Month, "-01 00:00:00"),
          "%Y-%m-%d %H:%i:%s"
      ) Date,
  apel_iris_grid.userdn.name GlobalUserName,
  apel_iris_grid.vos.name VO,
  apel_iris_grid.vogroup.name VOGroup,
  apel_iris_grid.vorole.name VORole,
  apel_iris_grid.HybridSuperSummaries.Processors as CpuCount,
  apel_iris_grid.HybridSuperSummaries.WallDuration,
  apel_iris_grid.HybridSuperSummaries.CpuDuration,
  'Grid' SourceSchema,
  apel_iris_shared.Projects.Project
FROM apel_iris_grid.HybridSuperSummaries,
  apel_iris_grid.Sites site,
  apel_iris_grid.DNs userdn,
  apel_iris_grid.VORoles vorole,
  apel_iris_grid.VOs vos,
  apel_iris_grid.VOGroups vogroup,
  apel_iris_shared.Projects
WHERE
  apel_iris_grid.HybridSuperSummaries.SiteID = apel_iris_grid.site.id
  AND apel_iris_grid.HybridSuperSummaries.GlobalUserNameID = apel_iris_grid.userdn.id
  AND apel_iris_grid.HybridSuperSummaries.VORoleID = apel_iris_grid.vorole.id
  AND apel_iris_grid.HybridSuperSummaries.VOID = apel_iris_grid.vos.id
  AND apel_iris_grid.HybridSuperSummaries.VOGroupID = apel_iris_grid.vogroup.id
  AND apel_iris_shared.Projects.Site = apel_iris_grid.site.name

UNION

SELECT
  apel_iris_cloud.CloudSummaries.UpdateTime,
  apel_iris_cloud.site.name Site,
  STR_TO_DATE(
          CONCAT(apel_iris_cloud.CloudSummaries.Year, "-", apel_iris_cloud.CloudSummaries.Month, "-01 00:00:00"),
          "%Y-%m-%d %H:%i:%s"
      ) Date,
  apel_iris_cloud.userdn.name GlobalUserName,
  apel_iris_cloud.vos.name VO,
  apel_iris_cloud.vogroup.name VOGroup,
  apel_iris_cloud.vorole.name VORole,
  apel_iris_cloud.CloudSummaries.CpuCount,
  apel_iris_cloud.CloudSummaries.WallDuration,
  apel_iris_cloud.CloudSummaries.CpuDuration,
  'Cloud' SourceSchema,
  apel_iris_shared.Projects.Project
FROM apel_iris_cloud.CloudSummaries,
  apel_iris_cloud.Sites site,
  apel_iris_cloud.DNs userdn,
  apel_iris_cloud.VORoles vorole,
  apel_iris_cloud.VOs vos,
  apel_iris_cloud.VOGroups vogroup,
  apel_iris_shared.Projects
WHERE
  apel_iris_cloud.CloudSummaries.SiteID = apel_iris_cloud.site.id
  AND apel_iris_cloud.CloudSummaries.GlobalUserNameID = apel_iris_cloud.userdn.id
  AND apel_iris_cloud.CloudSummaries.VORoleID = apel_iris_cloud.vorole.id
  AND apel_iris_cloud.CloudSummaries.VOID = apel_iris_cloud.vos.id
  AND apel_iris_cloud.CloudSummaries.VOGroupID = apel_iris_cloud.vogroup.id
  AND apel_iris_shared.Projects.Site = apel_iris_cloud.site.name
  AND apel_iris_cloud.CloudSummaries.Month <> 0;

CREATE VIEW VMonthlyAllocations AS
SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-04-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-05-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-06-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-07-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-08-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-09-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-10-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-11-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date), '-12-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date)+1, '-01-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date)+1, '-02-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations

UNION

SELECT
  STR_TO_DATE(CONCAT(YEAR(Date)+1, '-03-01'), '%Y-%m-%d') AS "Date",
  Allocation,
  Activity AS "VO"
FROM Allocations;
