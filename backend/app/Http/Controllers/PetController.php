<?php

namespace App\Http\Controllers;

use App\Models\Pet;
use Illuminate\Http\Request;

class PetController extends Controller
{
    public function index(Request $request)
    {
        $query = Pet::query();

        if ($request->has('type') && $request->type !== 'Semua') {
            $query->where('type', $request->type);
        }

        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('name', 'like', "%$search%")
                  ->orWhere('breed', 'like', "%$search%");
            });
        }

        return response()->json([
            'success' => true,
            'data' => $query->get()
        ]);
    }

    public function show($id)
    {
        $pet = Pet::findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => $pet
        ]);
    }
}