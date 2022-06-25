<?php

namespace App\Http\Controllers;

use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        $member = Member::query()->firstWhere(['email' => $email]);

        if ($member == null) {
            return $this->responseHasil(400, false , 'email tidak ditemukan');
        }
        if (!Hash::check($password, $member->password)) {
            return $this->responseHasil(400, false, 'Password tidak valid');
        }

        // persiapan data
        $data = [
            'User'  => [
                'id'    => $member->id,
                'nama' => $member->nama,
                'email' => $member->email,
                'nik'    => $member->nik,
                'gambar'    => $member->gambar,

            ]
        ];
        return $this->responseHasil(200, true, $data);
    }
}
