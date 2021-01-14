class StateLatLong {
  int id;
  String state;
  double lat;
  double long;

  StateLatLong(this.id, this.state, this.lat, this.long);

  getStateLatLong() {
    List<StateLatLong> listStateLatLong = [
      StateLatLong(1, 'Alabama', 32.7794, -86.8287),
      StateLatLong(2, 'Alaska', 64.0685, -152.2782),
      StateLatLong(3, 'Arizona', 34.2744, -111.6602),
      StateLatLong(4, 'Arkansas', 34.8938, -92.4426),
      StateLatLong(5, 'California', 37.1841, -119.4696),
      StateLatLong(6, 'Colorado', 38.9972, 	-105.5478),
      StateLatLong(7, 'Connecticut', 41.6219, -72.7273),
      StateLatLong(8, 'Delaware', 38.9896, -75.5050),
      StateLatLong(9, 'District of Columbia', -38.9101, 77.0147),
      StateLatLong(10, 'Florida', 28.6305, 	-82.4497),
      StateLatLong(11, 'Georgia', 32.6415, -83.4426),
      StateLatLong(12, 'Hawaii', 20.2927, -156.3737),
      StateLatLong(13, 'Idaho', 44.3509, -114.6130),
      StateLatLong(14, 'Illinois', 40.0417, -89.1965),
      StateLatLong(15, 'Indiana', 39.8942, -86.2816),
      StateLatLong(16, 'Iowa', 42.0751, -93.4960),
      StateLatLong(17, 'Kansas', 38.4937, -98.3804),
      StateLatLong(18, 'Kentucky', 37.5347, -85.3021),
      StateLatLong(19, 'Louisiana', 31.0689, -91.9968),
      StateLatLong(20, 'Maine', 45.3695, -69.2428),
      StateLatLong(21, 'Maryland', 39.0550, -76.7909),
      StateLatLong(22, 'Massachusetts', 42.2596, -71.8083),
      StateLatLong(23, 'Michigan', 44.3467,	-85.4102),
      StateLatLong(24, 'Minnesota', 46.2807, -94.3053),
      StateLatLong(25, 'Mississippi', 32.7364, -89.6678),
      StateLatLong(26, 'Missouri', 38.3566, -92.4580),
      StateLatLong(27, 'Montana', 47.0527, 	-109.6333),
      StateLatLong(28, 'Nebraska', 41.5378, -99.7951),
      StateLatLong(29, 'Nevada', 39.3289, -116.6312),
      StateLatLong(30, 'New Hampshire', 43.6805, -71.5811),
      StateLatLong(31, 'New Jersey', 40.1907, -74.6728),
      StateLatLong(32, 'New Mexico', 34.4071, -106.1126),
      StateLatLong(33, 'New York', 42.9538, -75.5268),
      StateLatLong(34, 'North Carolina', 35.5557, -79.3877),
      StateLatLong(35, 'North Dakota', 47.4501, -100.4659),
      StateLatLong(36, 'Ohio', 40.2862, -82.7937),
      StateLatLong(37, 'Oklahoma', 35.5889, -97.4943),
      StateLatLong(38, 'Oregon', 43.9336, -120.5583),
      StateLatLong(39, 'Pennsylvania', 40.8781, -77.7996),
      StateLatLong(40, 'Rhode Island', 41.6762, -71.5562),
      StateLatLong(41, 'South Carolina', 33.9169, -80.8964),
      StateLatLong(42, 'South Dakota', 44.4443, -100.2263),
      StateLatLong(43, 'Tennessee', 35.8580, -86.3505),
      StateLatLong(44, 'Texas', 31.4757, -99.3312),
      StateLatLong(45, 'Utah', 39.3055, -111.670),
      StateLatLong(46, 'Vermont', 44.0687, -72.6658),
      StateLatLong(47, 'Virginia', 37.5215, -78.8537),
      StateLatLong(48, 'Washington', 47.3826, -120.4472),
      StateLatLong(49, 'West Virginia', 38.6409, -80.6227),
      StateLatLong(50, 'Wisconsin', 44.6243, -89.9941),
      StateLatLong(51, 'Wyoming', 42.9957, -107.5512),
    ];
    return listStateLatLong;
  }
}
