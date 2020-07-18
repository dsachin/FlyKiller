import 'package:fly_killer/fly/fly.dart';
import 'package:fly_killer/fly_killer.dart';

class SpawnController {
  final FlyKiller flyKiller;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFliesOnScreen = 7;

  int currentInterval;
  int nextSpawn;
  SpawnController(this.flyKiller) {
    start();
    flyKiller.spawnfly();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    flyKiller.flies.forEach((Fly fly) => fly.isDead = true);
  }

  void update(double t) {
    int nowTimeStamp = DateTime.now().millisecondsSinceEpoch;
    int livingFlies = 0;

    flyKiller.flies.forEach((Fly fly) {
      if (!fly.isDead) livingFlies++;
    });

    if (nowTimeStamp >= nextSpawn && livingFlies < maxFliesOnScreen) {
      flyKiller.spawnfly();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= minSpawnInterval;
        currentInterval -= (currentInterval * 0.02).toInt();
      }
      nextSpawn = nowTimeStamp + currentInterval;
    }
  }
}
