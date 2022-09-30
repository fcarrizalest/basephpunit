<?php
use PHPUnit\Framework\TestCase;

use App\Services\TwService;

final class TwServiceTest extends TestCase
{
    public function testValidation(): void
    {
        
        $obj = new TwService();

        $flag = $obj->upload();

        $this->assertTrue(  $flag );
    }


}