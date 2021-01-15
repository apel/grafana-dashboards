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
  iris_grid.HybridSuperSummaries.UpdateTime,
  iris_grid.site.name Site,
  STR_TO_DATE(
          CONCAT(iris_grid.HybridSuperSummaries.Year, "-", iris_grid.HybridSuperSummaries.Month, "-01 00:00:00"),
          "%Y-%m-%d %H:%i:%s"
      ) Date,
  iris_grid.userdn.name GlobalUserName,
  iris_grid.vos.name VO,
  iris_grid.vogroup.name VOGroup,
  iris_grid.vorole.name VORole,
  iris_grid.HybridSuperSummaries.Processors as CpuCount,
  iris_grid.HybridSuperSummaries.WallDuration,
  iris_grid.HybridSuperSummaries.CpuDuration,
  'Grid' SourceSchema,
  iris_shared.Projects.Project
FROM iris_grid.HybridSuperSummaries,
  iris_grid.Sites site,
  iris_grid.DNs userdn,
  iris_grid.VORoles vorole,
  iris_grid.VOs vos,
  iris_grid.VOGroups vogroup,
  iris_shared.Projects
WHERE
  iris_grid.HybridSuperSummaries.SiteID = iris_grid.site.id
  AND iris_grid.HybridSuperSummaries.GlobalUserNameID = iris_grid.userdn.id
  AND iris_grid.HybridSuperSummaries.VORoleID = iris_grid.vorole.id
  AND iris_grid.HybridSuperSummaries.VOID = iris_grid.vos.id
  AND iris_grid.HybridSuperSummaries.VOGroupID = iris_grid.vogroup.id
  AND iris_shared.Projects.Site = iris_grid.site.name

UNION

SELECT
  iris_cloud.CloudSummaries.UpdateTime,
  iris_cloud.site.name Site,
  STR_TO_DATE(
          CONCAT(iris_cloud.CloudSummaries.Year, "-", iris_cloud.CloudSummaries.Month, "-01 00:00:00"),
          "%Y-%m-%d %H:%i:%s"
      ) Date,
  iris_cloud.userdn.name GlobalUserName,
  iris_cloud.vos.name VO,
  iris_cloud.vogroup.name VOGroup,
  iris_cloud.vorole.name VORole,
  iris_cloud.CloudSummaries.CpuCount,
  iris_cloud.CloudSummaries.WallDuration,
  iris_cloud.CloudSummaries.CpuDuration,
  'Cloud' SourceSchema,
  iris_shared.Projects.Project
FROM iris_cloud.CloudSummaries,
  iris_cloud.Sites site,
  iris_cloud.DNs userdn,
  iris_cloud.VORoles vorole,
  iris_cloud.VOs vos,
  iris_cloud.VOGroups vogroup,
  iris_shared.Projects
WHERE
  iris_cloud.CloudSummaries.SiteID = iris_cloud.site.id
  AND iris_cloud.CloudSummaries.GlobalUserNameID = iris_cloud.userdn.id
  AND iris_cloud.CloudSummaries.VORoleID = iris_cloud.vorole.id
  AND iris_cloud.CloudSummaries.VOID = iris_cloud.vos.id
  AND iris_cloud.CloudSummaries.VOGroupID = iris_cloud.vogroup.id
  AND iris_shared.Projects.Site = iris_cloud.site.name
  AND iris_cloud.CloudSummaries.Month <> 0;

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
