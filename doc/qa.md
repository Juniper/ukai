# Test

## Scenario Test

- [x] ID Pool
- [x] Network
- [x] Image
- [x] Security Group
- [x] Security Group Rule
- [x] Server
- [x] Service Tempalte
- [x] Service Instance
- [x] Network Policy
- [x] Heat
- [x] Location
- [x] Flavor

## Negative API Test

### 400 Bad Request

- [x] ID Pool
- [x] Network
- [x] Image
- [x] Server
- [x] Security Group
- [x] Security Group Rule
- [x] Service Tempalte
- [x] Service Instance
- [x] Network Policy
- [x] Heat
- [x] Location

### 409 Conflict

- [x] Network
- [x] Image
- [x] Location
- [x] Security Group / Rule
- [x] Service Tempalte
- [x] Service Instance
- [x] Network Policy
- [x] Heat
- [x] Location

### 401 Unauthorized

- [x] ID Pool
- [x] Network
- [x] Image
- [x] Location
- [x] Security Group / Rule
- [x] Service Tempalte
- [x] Service Instance
- [x] Network Policy
- [x] Heat
- [x] Location
- [x] Flavor

### Southbound Error

- [x] Network
- [x] Image
- [x] Location
- [x] Security Group
- [x] Security Group Rule
- [x] Service Tempalte
- [x] Service Instance
- [x] Network Policy
- [x] Heat
- [x] Location
- [x] Flavor

## Failure Test

Global Controller Side issue

- [ ] Gohan Down / Restart
- [ ] MySQL Down
- [ ] MySQL Data Loss & rollback to backup
- [ ] MySQL Restart
- [ ] Keystone Down
- [ ] Keystone Restart

Location Down
- [x] Network Down
- [ ] API Server Down
- [ ] API Server Zombie Status

- [ ] Data Loss in Location
- [ ] Configuraion Consistency Issue

## Upgrade test

- [ ] Test upgrade status

## Stability test

- [ ] long running test with benchmark test
- [ ] memory & performance test
- [ ] high load test

## Benchmark test

- [ ] Benchmark Test
