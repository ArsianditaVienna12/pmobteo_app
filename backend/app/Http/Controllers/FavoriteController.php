<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function index(Request $request)
    {
        $favorites = Favorite::with('pet')
            ->where('user_id', $request->user()->id)
            ->get();

        return response()->json([
            'success' => true,
            'data' => $favorites
        ]);
    }

    public function toggle(Request $request, $petId)
    {
        $userId = $request->user()->id;

        $favorite = Favorite::where('user_id', $userId)
            ->where('pet_id', $petId)
            ->first();

        if ($favorite) {
            $favorite->delete();
            return response()->json([
                'success' => true,
                'message' => 'Dihapus dari favorit',
                'favorited' => false
            ]);
        }

        Favorite::create([
            'user_id' => $userId,
            'pet_id' => $petId,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Ditambahkan ke favorit',
            'favorited' => true
        ]);
    }
}