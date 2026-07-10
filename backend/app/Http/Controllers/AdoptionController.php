<?php

namespace App\Http\Controllers;

use App\Models\Adoption;
use App\Models\Pet;
use Illuminate\Http\Request;

class AdoptionController extends Controller
{
    public function index(Request $request)
    {
        $adoptions = Adoption::with('pet')
            ->where('user_id', $request->user()->id)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $adoptions
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'pet_id' => 'required|exists:pets,id',
            'applicant_name' => 'required|string',
            'phone' => 'required|string',
            'address' => 'required|string',
        ]);

        $pet = Pet::find($request->pet_id);
        if ($pet->status !== 'Tersedia') {
            return response()->json([
                'success' => false,
                'message' => 'Hewan sudah diadopsi'
            ], 400);
        }

        $adoption = Adoption::create([
            'user_id' => $request->user()->id,
            'pet_id' => $request->pet_id,
            'applicant_name' => $request->applicant_name,
            'phone' => $request->phone,
            'address' => $request->address,
            'status' => 'pending',
        ]);

        $pet->update(['status' => 'Diadopsi']);

        return response()->json([
            'success' => true,
            'message' => 'Pengajuan adopsi berhasil',
            'data' => $adoption
        ], 201);
    }
}