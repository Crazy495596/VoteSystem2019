package Dao;

import java.util.List;

import Model.Singer;

public interface SingerDao {
	 int addSinger(Singer singer);
	 List<Singer> getSingers();
}
