INSERT INTO IrisVOs VALUES
    ('AENEAS'),('casu'),('CCFE'),('CCP4'),('CLF'),('DAFNI'),('Diamond'),
    ('dirac'),('eMERLIN'),('EUCLID'),('gaia'),('gaia-dev'),('gaia-prod'),
    ('gaia-test'),('ISIS'),('jintrac'),('LSST'),('lz'),('ska'),
    ('skatelescope.eu'),('ccfe'),('clas12'),('dune'),('jintrac'),('lsst'),
    ('lz'),('skatelescope.eu'),('virgo'),('vo.cta.in2p3.fr');

INSERT INTO Capacity VALUES
    ("2018-01-01 00:00:00", "SCD", 0),("2018-01-01 00:00:00", "DiRAC", 0),
    ("2018-01-01 00:00:00", "GridPP", 0),("2018-04-01 00:00:00", "SCD", 1469),
    ("2018-04-01 00:00:00", "DiRAC", 0),("2018-04-01 00:00:00", "GridPP", 1306),
    ("2019-04-01 00:00:00", "SCD", 3482),("2019-04-01 00:00:00", "DiRAC", 1088),
    ("2019-04-01 00:00:00", "GridPP", 2720);

INSERT INTO Allocations VALUES
    ("2019-04-01", "lsst", 1312),("2019-04-01", "lz", 300),
    ("2019-04-01", "skatelescope.eu", 1920),("2019-04-01", "dune", 1000),
    ("2019-04-01", "vo.cta.in2p3.fr", 285),("2019-04-01", "virgo", 270),
    ("2019-04-01", "ISIS", 175),("2019-04-01", "Diamond", 2100),
    ("2019-04-01", "CLF", 68),("2019-04-01", "CCFE", 1250),
    ("2019-04-01", "EUCLID", 3100),("2019-04-01", "eMERLIN", 96),
    ("2019-04-01", "jintrac", 200);

INSERT INTO Projects VALUES
    ("ral-cloud", "SCD"),("UK-CAM-CUMULUS", "DiRAC"),
    ("UKI-LT2-IC-HEP", "GridPP"),("RAL-LCG2", "GridPP"),
    ("UKI-LT2-Brunel", "GridPP"),("UKI-LT2-QMUL", "GridPP"),
    ("UKI-LT2-RHUL", "GridPP"),("UKI-NORTHGRID-LANCS-HEP", "GridPP"),
    ("UKI-NORTHGRID-LIV-HEP", "GridPP"),("UKI-NORTHGRID-MAN-HEP", "GridPP"),
    ("UKI-NORTHGRID-SHEF-HEP", "GridPP"),("UKI-SCOTGRID-ECDF", "GridPP"),
    ("UKI-SCOTGRID-GLASGOW", "GridPP"),("UKI-SOUTHGRID-BHAM-HEP", "GridPP"),
    ("UKI-SOUTHGRID-BRIS-HEP", "GridPP"),("UKI-SOUTHGRID-CAM-HEP", "GridPP"),
    ("UKI-SOUTHGRID-OX-HEP", "GridPP"),("UKI-SOUTHGRID-RALPP", "GridPP");
