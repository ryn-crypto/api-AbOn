<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Models\Jadwal;
use DateTime;
use Illuminate\Http\Request;
use DB;

class AbsensiController extends Controller
{
    public function Absen(Request $request)
    {
        // set timezone
        date_default_timezone_set("Asia/Jakarta");
        // waktu saat ini
        $now = time();
        $tanggal = date('d', $now);

        // persiapan data
        $nik = $request->input('nik');
        $id = $request->input('id');

        // ambil jadwal
        $jadwal = Jadwal::query()
                        ->join('shift', 'shift.id', '=', 'jadwal.shift_id')
                        ->where(['nik' => $nik])
                        ->where(['tanggal' => $tanggal])
                        ->get();

        // ambil absen hari ini
        $absensi = Absensi::query()
                        ->where(['user_id' => $id])
                        ->where(['tanggal' => $tanggal])
                        ->get();

        // $jadwal_pulang = $jadwal[0]->jam_pulang;

        if (count($absensi) == 0) {
            if (count($jadwal) == 0) {
                return $this->responseHasil(400, false, 'tidak ada jadwal absen');
            } else {

                // absen masuk
                $sekarang = date('H:i', $now);
                
                $jadwal_masuk = $jadwal[0]->jam_masuk;
                
                $jam    = (substr($sekarang, 0, 2)) - (substr($jadwal_masuk, 0, 2));
                $menit  = (substr($sekarang, -2)) - (substr($jadwal_masuk, -2));
                
                if ($jam > 1) {
                    $terlambat = ($jam * 60) + $menit;
                    $denda = ($terlambat / 10) * 5000;
                    
                    // insert ke database
                    Absensi::create([
                        'user_id'       => $id,
                        'tanggal'       => $tanggal,
                        'terlambat'     => $terlambat,
                        'denda'         => $denda,
                        'waktu_masuk'   => $now
                    ]);

                    return $this->responseHasil(200, true, 'Absensi berhasil');
                } else {
                    Absensi::create([
                        'user_id'       => $id,
                        'tanggal'       => $tanggal,
                        'waktu_masuk'   => $now
                    ]);

                    return $this->responseHasil(200, true, 'Absensi berhasil');
                }
                
            }

        } else {
            // absen pulang 
            $pulang  = ['waktu_pulang' => $now];

            $result = app('db')->table('absensi')
                                ->where('user_id', $id)
                                ->where('tanggal', $tanggal)
                                ->update($pulang);

            return $this->responseHasil(200, true, 'Absensi berhasil');

        }
    }


    public function Jadwal(Request $request)
    {
        $nik = $request->input('nik');

        $result = Jadwal::query()
                    ->join('shift', 'shift.id', '=', 'jadwal.shift_id')
                    ->where(['nik' => $nik])
                    ->get();
    
        return $this->responseHasil(200, true, $result);
    }
}
