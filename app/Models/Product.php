<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Product
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property string $image
 * @property int $price
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|Product newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Product newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Product query()
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereImage($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product wherePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|Product whereUpdatedAt($value)
 * @mixin \Eloquent
 */
class Product extends Model
{
    public function getId()
    {
    return $this->attributes['id'];
    }
    public function setId($id)
    {
    $this->attributes['id'] = $id;
    }
    public function getName()
    {
    return $this->attributes['name'];
    }
    public function setName($name)
    {
    $this->attributes['name'] = $name;
    }
    public function getDescription()
    {
    return $this->attributes['description'];
    }
    public function setDescription($description)
    {
    $this->attributes['description'] = $description;
    }
    public function getImage()
    {
    return $this->attributes['image'];
    }
    public function setImage($image)
    {
    $this->attributes['image'] = $image;
    }
    public function getPrice()
    {
    return $this->attributes['price'];
    }
    public function setPrice($price)
    {
    $this->attributes['price'] = $price;
    }
    public function getCreatedAt()
    {
    return $this->attributes['created_at'];
    }
    public function setCreatedAt($createdAt)
    {
    $this->attributes['created_at'] = $createdAt;
    }
    public function getUpdatedAt()
    {
    return $this->attributes['updated_at'];
    }
    public function setUpdatedAt($updatedAt)
    {
    $this->attributes['updated_at'] = $updatedAt;
    }
    
}
