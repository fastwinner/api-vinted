<?php

namespace Database\Factories;

use App\Models\Article;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Article>
 */
class ArticleFactory extends Factory
{

    protected static $imageCounter = 1;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    protected $model = Article::class;
    public function definition(): array
    {
        $imageName = 'assets/images/image' . self::$imageCounter . '.jpg';
        self::$imageCounter++;
        return [
            'user_id' => User::factory(),
            'prix' => $this->faker->randomFloat(2, 1, 1000),
            'etat' => $this->faker->randomElement(['neuf', 'occasion']),
            'titre' => fake()->words(2, true),
            'description' => $this->faker->paragraph,
            'marque' => $this->faker->company,
            'categorie' => $this->faker->word,
            'taille' => $this->faker->randomElement(['S', 'M', 'L', 'XL']),
            'couleur' => $this->faker->safeColorName,
            'nombre_de_vues' => $this->faker->numberBetween(0, 1000),
            'membres_interesses' => $this->faker->numberBetween(0, 100),
            'ajoute_le' => $this->faker->date,
            'mode_de_payement' => $this->faker->randomElement(['carte', 'paypal', 'virement']),
            'photo' => $imageName,

        ];
    }
}
