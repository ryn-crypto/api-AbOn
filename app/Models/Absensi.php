<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    protected $table = 'absensi';
    protected $fillable = ['user_id', 'tanggal' , 'terlambat' , 'denda' , 'waktu_masuk' , 'waktu_pulang'];
    public $timestamps = false;
}