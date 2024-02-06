/* tslint:disable */
/* eslint-disable */
/**
 * Immich
 * Immich API
 *
 * The version of the OpenAPI document: 1.94.1
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import { exists, mapValues } from '../runtime';
import type { PersonResponseDto } from './PersonResponseDto';
import {
    PersonResponseDtoFromJSON,
    PersonResponseDtoFromJSONTyped,
    PersonResponseDtoToJSON,
} from './PersonResponseDto';

/**
 * 
 * @export
 * @interface PeopleResponseDto
 */
export interface PeopleResponseDto {
    /**
     * 
     * @type {Array<PersonResponseDto>}
     * @memberof PeopleResponseDto
     */
    people: Array<PersonResponseDto>;
    /**
     * 
     * @type {number}
     * @memberof PeopleResponseDto
     */
    total: number;
}

/**
 * Check if a given object implements the PeopleResponseDto interface.
 */
export function instanceOfPeopleResponseDto(value: object): boolean {
    let isInstance = true;
    isInstance = isInstance && "people" in value;
    isInstance = isInstance && "total" in value;

    return isInstance;
}

export function PeopleResponseDtoFromJSON(json: any): PeopleResponseDto {
    return PeopleResponseDtoFromJSONTyped(json, false);
}

export function PeopleResponseDtoFromJSONTyped(json: any, ignoreDiscriminator: boolean): PeopleResponseDto {
    if ((json === undefined) || (json === null)) {
        return json;
    }
    return {
        
        'people': ((json['people'] as Array<any>).map(PersonResponseDtoFromJSON)),
        'total': json['total'],
    };
}

export function PeopleResponseDtoToJSON(value?: PeopleResponseDto | null): any {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    return {
        
        'people': ((value.people as Array<any>).map(PersonResponseDtoToJSON)),
        'total': value.total,
    };
}
